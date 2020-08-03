package instagram;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class IreplyMgr {
	
	private DBConnectionMgr pool;
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	public IreplyMgr() {
		
		pool = DBConnectionMgr.getInstance();
		
	}
	
	
	
	
	
	
	
	
	public void insertReply(ReplyBean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblireply(num,email,rdate,comment,nickname) values(?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getComment());
			pstmt.setString(4, bean.getNickname());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	
	public void deleteReply(int rnum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblireply where rnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	
	public void deleteAllIreply(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblireply where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	public Vector<ReplyBean> listIReply(int num) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ReplyBean> vlist = new Vector<ReplyBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblireply where num=? order by rnum ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyBean bean = new ReplyBean();
				bean.setRnum(rs.getInt(1));
				bean.setNum(rs.getInt(2));
				bean.setEmail(rs.getString(3));
				
				bean.setRdate(rs.getString(4));
				
				bean.setComment(rs.getString(5));
				bean.setNickname(rs.getString(6));
				vlist.addElement(bean);
				

				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
		
		
	}
	
	

	
	
	
	
}
