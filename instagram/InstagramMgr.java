package instagram;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import photoBlog.UtilMgr;



public class InstagramMgr {
		
	DBConnectionMgr pool;
	
	public static final String  SAVEFOLDER = "C:/Jsp/myapp/WebContent/instagram/img/";
	public static final String ENCTYPE = "UTF-8";
	public static int MAXSIZE = 5*1024*1024;


	 public static final int SEC = 60;
     public static final int MIN = 60;
     public static final int HOUR = 24;
     public static final int DAY = 30;
     public static final int MONTH = 12;
     public static final int YEAR = 1;
	
	
	
	
	public InstagramMgr() {
		
		pool = DBConnectionMgr.getInstance();
		
	}

	
	
	public String calculateTime(Date date) {
		
		
		
	    long curTime = System.currentTimeMillis();
	    long regTime = date.getTime();
	    long diffTime = (curTime - regTime) / 1000;

	    String msg = null;

	    if(diffTime < TIME_MAXIMUM.SEC) {
	        // sec
	        msg = diffTime + "초전";
	    } else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
	        // min
	        
	        msg = diffTime + "분전";
	    } else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
	        // hour
	        msg = (diffTime ) + "시간전";
	    } else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
	        // day
	        msg = (diffTime ) + "일전";
	    } else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
	        // day
	        msg = (diffTime ) + "달전";
	    } else {
	        msg = (diffTime /= TIME_MAXIMUM.MONTH) + "년 전";


	    }
	    

	return msg;

	}

	
	
	
	
	
	
	public boolean loginIMember(String email, String password) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag= false; 
		try {
			con = pool.getConnection();
			sql = "select email from tblimember where email=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			flag = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
		
	}
	
	
	
	//한명의 회원정보를 리턴
public IMemberbean getImember(String email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		IMemberbean bean = new IMemberbean();
		try {
			con = pool.getConnection();
			sql = "select name, profile from tblimember where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setEmail(email);
				bean.setName(rs.getString(1));
				bean.setProfile(rs.getString(2));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
		
	}
	
	
	//리스트
	public Vector<IBlogBean> listI(String email) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<IBlogBean> Ibean = new Vector<IBlogBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tbliblog where email=? order by num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				IBlogBean bean = new IBlogBean();
				bean.setNum(rs.getInt(1));
				bean.setMessage(rs.getString(2));
				bean.setNickname(rs.getString(3));
				
//				Date pdate = dayTime.parse(rs.getString(4));
				
				bean.setPdate(rs.getString(4));
				bean.setPhoto(rs.getString(5));//포토
				bean.setHcnt(rs.getInt(6)); //좋아요
				bean.setEmail(rs.getString(7)); 
				bean.setCcnt(rs.getInt(8));
				Ibean.addElement(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return Ibean;
		
		
	}
	//
	public void upLike(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tbliblog set hcnt=hcnt+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	

		
		

	
	
	public boolean insertIMember(IMemberbean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblimember(name,nickname,password,email)"
					+ "values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getNickname());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getEmail());
			if(pstmt.executeUpdate()==1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
		
	}
	
	
	//랜덤으로 본인을 제외한 5명의 리스트
	
	public Vector<IMemberbean> listIMember(String email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<IMemberbean> pbean = new Vector<IMemberbean>();
		try {
			con = pool.getConnection();
			sql = "select email,nickname,profile from tblimember where email !=? order by rand() limit 5";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IMemberbean bean = new IMemberbean();
				bean.setEmail(rs.getString(1));
				bean.setNickname(rs.getString(2));
				bean.setProfile(rs.getString(3));
				pbean.addElement(bean);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return pbean;
		
		
	}
	
	
	//블로그 올리기
	
	public void insertIBlog(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			MultipartRequest multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE , ENCTYPE, new DefaultFileRenamePolicy());
			String photo = null;
			if(multi.getFilesystemName("photo") != null){
				photo = multi.getFilesystemName("photo");
				
				con = pool.getConnection();
				sql = "insert tbliblog(nickname,message,email,pdate,photo)values(?,?,?,now(),?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, multi.getParameter("nickname"));
				pstmt.setString(2, multi.getParameter("message"));
				pstmt.setString(3, multi.getParameter("email"));
				pstmt.setString(4, photo);
				pstmt.executeUpdate();
				System.out.println("사진 잇는거");
				
				
			}
			else if(multi.getFilesystemName("photo") == null){	
				con = pool.getConnection();
			sql = "insert tbliblog(nickname,message,email,pdate)values(?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("nickname"));
			pstmt.setString(2, multi.getParameter("message"));
			pstmt.setString(3, multi.getParameter("email"));
			pstmt.executeUpdate();
			System.out.println("사진 없는거");
			}
			
			
//			con = pool.getConnection();
//			sql = "insert tbliblog(message,email,pdate,photo)values(?,?,now(),?)";
//			pstmt = con.prepareStatement(sql);
//			
//		
//			pstmt.setString(1, multi.getParameter("message"));
//			pstmt.setString(2, multi.getParameter("email"));
//			pstmt.setString(3, photo);
//			pstmt.executeUpdate();
//			System.out.println("왔다~~~~~~~~~~~~~~~");
//			
			
		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	//맴버 값 얻기
	public IMemberbean getUser(String email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		IMemberbean bean = new IMemberbean();
		try {
			con = pool.getConnection();
			sql = "select * from tblimember where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setEmail(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setNickname(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setProfile(rs.getString(5));
				bean.setPhone(rs.getString(6));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
		
	}
	
	
	public IMemberbean getNickname(String email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		IMemberbean bean = new IMemberbean();
		try {
			con = pool.getConnection();
			sql = "select nickname from tblimember where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				bean.setNickname(rs.getString(1));

				
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
		
	}
	public static void delete(String s) {
		File file = new File(s);
		if (file.isFile()) {
			file.delete();
		}
	}
	
	public void memberUpdate(MultipartRequest multi) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
		
			con = pool.getConnection();
			String email = multi.getParameter("email");
			String name = multi.getParameter("name");
			String nickname = multi.getParameter("nickname");
			String password = multi.getParameter("password");
			//String profile = multi.getParameter("profile"); 업로드 파일은 이걸로 받으면 안된다!!!!!!!!!!
			String profile = multi.getFilesystemName("profile");
			String phone = multi.getParameter("phone");
			if(profile != null && !profile.equals("")) {
				
				IMemberbean ibean = getUser(email);
				String tempImage = ibean.getProfile();
				if(tempImage != null && !tempImage.equals("")) {
					File f = new File(SAVEFOLDER + tempImage);
					if(f.exists()) {
						delete(SAVEFOLDER+tempImage);
						
					}
					
				}
				
				
				sql = "update tblimember set name=?, nickname=?,password=?, profile=?, phone=? where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, nickname);
				pstmt.setString(3, password);
				pstmt.setString(4, profile);
				pstmt.setString(5, phone);
				pstmt.setString(6, email);
				pstmt.executeUpdate();
				
			}else {
				
				
				sql = "update tblimember set name=?, nickname=?,password=?,phone=? where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, nickname);
				pstmt.setString(3, password);
				pstmt.setString(4, phone);
				pstmt.setString(5, email);

				pstmt.executeUpdate();
				
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		
	}

		public Vector<IMemberbean> followlist(String email) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<IMemberbean> vlist = new Vector<IMemberbean>();
			try {
				con = pool.getConnection();
				sql = "select follow from tblimember where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
			
			
		}

		public String getPhoto(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String photo = null;
			try {
				con = pool.getConnection();
				sql = "select photo from tbliblog where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					photo = rs.getString(1);
					
					
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return photo;
			
			
			
		}
		
		
		
		//업로드 파일 삭제
		public void deleteIBlog(int num) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				
				String photo = getPhoto(num);
				if(photo!=null) {
					File file = new File(SAVEFOLDER+"/"+photo);
					if(file.exists()) {
						UtilMgr.delete(SAVEFOLDER+"/"+photo);
						
					}
					
				}
				
				con = pool.getConnection();
				sql = "delete from tbliblog where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			
			
		}
		
		public Vector<FollowBean> getFollow(String email) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<FollowBean> vlist = new Vector<FollowBean>();
			try {
				con = pool.getConnection();
				sql = "select * from tblifollow where follower=? or followed=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setString(2, email);
				
				rs = pstmt.executeQuery();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
			
			
		}
		
		
		public boolean isfollowed(String email, String gemail) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "select * from tblifollow where follower=? and followed=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setString(2, gemail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					
					flag=true;
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
			
			
			
		}
		
		
		public void following(String email, String gemail) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert into tblifollow(follower,followed) values(?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setString(2, gemail);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			
			
		}
	
		
		public int getfollow(String email) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int count = 0;
			
			try {
				con = pool.getConnection();
				sql = "SELECT COUNT(*) FROM tblifollow WHERE follower= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
			if(rs.next()) {
			
				count = rs.getInt(1);
			
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return count;
			
			
		}
		
		
		
public int getfollowed(String email) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int count = 0;
			
			try {
				con = pool.getConnection();
				sql = "SELECT COUNT(*) FROM tblifollow WHERE followed= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
			if(rs.next()) {
	
				count = rs.getInt(1);

			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return count;
			
			
		}
		
		
		
		
		
	public Vector<IBlogBean> getfollower(String email) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<IBlogBean> vlist = new Vector<IBlogBean>();
			try {
				con = pool.getConnection();
				sql = "select f.follower FROM tblifollow f,tblimember m where followed=email and follower=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
			
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
			
			
		}
		
		

	
	
	
		
		
}


