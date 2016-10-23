package myproject.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import myproject.db.ConnectionPoolMgr;

public class MemberDAO {
		private ConnectionPoolMgr pool;
		
		public MemberDAO() {
			pool = new ConnectionPoolMgr();
		}
		
		public int insertMember(MemberVO vo){
			Connection conn = null;
			PreparedStatement ps = null;
			int cnt = 0;
			try{
				conn = pool.getConnection();
				String sql = "insert into member "
						+ "(no,userid,name,pwd,email,hp) "
						+ "values (member_seq.nextval,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getUserid());
				ps.setString(2, vo.getName());
				ps.setString(3, vo.getPwd());
				ps.setString(4, vo.getEmail());
				ps.setString(5, vo.getHp());
				
				cnt = ps.executeUpdate();
				System.out.println("입력값 cnt = "+cnt +", vo = "+vo);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pool.dbClose(null, ps, conn);
			}
			return cnt;
		}
}








