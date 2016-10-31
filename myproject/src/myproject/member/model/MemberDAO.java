package myproject.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import myproject.db.ConnectionPoolMgr;

public class MemberDAO {
		private ConnectionPoolMgr pool;
		
		public static final int LOGIN_OK = 1; 
		public static final int PWD_DISMATCH = 2; 
		public static final int ID_NONE = 3;
		
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
						+ "(no,userid,name,pwd,email,hp, "
						+ "zipcode, address, addressdetail) "
						+ "values (member_seq.nextval,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getUserid());
				ps.setString(2, vo.getName());
				ps.setString(3, vo.getPwd());
				ps.setString(4, vo.getEmail());
				ps.setString(5, vo.getHp());
				ps.setString(6, vo.getZipcode());
				ps.setString(7, vo.getAddress());
				ps.setString(8, vo.getAddressDetail());
				
				cnt = ps.executeUpdate();
				System.out.println("입력값 cnt = "+cnt +", vo = "+vo);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pool.dbClose(null, ps, conn);
			}
			return cnt;
		}
		
		public int checkId(String userid){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			int cnt = 0;
			try{
				conn = pool.getConnection();
				String sql = "select count(*) from member where userid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, userid);
				rs = ps.executeQuery();
				
				if(rs.next()){
					cnt = rs.getInt("count(*)");
				}
			} catch(SQLException e){
				e.printStackTrace();
			} finally{
				pool.dbClose(rs, ps, conn);
			}
			return cnt;
		}
		
		public int loginCheck(String id, String password){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			int result = 0 ;
			try{
				conn= pool.getConnection();
				String sql = "select pwd from member "
						+ "where userid = ? and outdate is null";
				ps= conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if(rs.next()){
					String dbPwd = rs.getString("pwd");
					if(password.equals(dbPwd)){
						result = LOGIN_OK;
					} else {
						result = PWD_DISMATCH;
					}
				} else{
					result = ID_NONE;
				}
			} catch(SQLException e){
				e.printStackTrace();
			} finally{
				pool.dbClose(rs, ps, conn);
			}
			return result;
		}
		
		public MemberVO selectById(String id){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			MemberVO vo = null;
			
			try{
				conn= pool.getConnection();
				String sql = "select * from member where userid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs= ps.executeQuery();
				
				if(rs.next()){
					int no = rs.getInt("no");
					String name= rs.getString("name");
					String pwd= rs.getString("pwd");
					String email =rs.getString("email");
					String zipcode =rs.getString("zipcode");
					String address = rs.getString("address");
					String addressDetail = rs.getString("addressDetail");
					String hp = rs.getString("hp");
					String authCode = rs.getString("authcode");
					Timestamp regdate = rs.getTimestamp("regdate");
					Timestamp outdate = rs.getTimestamp("outdate");
					String userid = rs.getString("userid");
					
					vo = new MemberVO(no, userid, name, pwd, email, hp, zipcode, address, addressDetail, regdate, authCode, outdate);
					
				}
			} catch(SQLException e){
				e.printStackTrace();
			} finally{
				pool.dbClose(rs, ps, conn);
			}
			return vo;
		}
		
		public int updateMember(MemberVO vo){
			Connection conn = null;
			PreparedStatement ps = null;
			int cnt = 0;
			try{
				conn = pool.getConnection();
				String sql = "update member set pwd = ? , hp = ?  , "
						+ " email = ?, zipcode = ? , address= ? , addressdetail = ? "
						+ " where userid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getPwd());
				ps.setString(2, vo.getHp());
				ps.setString(3, vo.getEmail());
				ps.setString(4, vo.getZipcode());
				ps.setString(5, vo.getAddress());
				ps.setString(6, vo.getAddressDetail());
				ps.setString(7, vo.getUserid());
				
				cnt = ps.executeUpdate();
			} catch(SQLException e){
				e.printStackTrace();
			} finally{
				pool.dbClose(null, ps, conn);
			}
			return cnt;
		}
		
		
		public int deleteMember(String userid, String pwd){
			Connection conn = null;
			PreparedStatement ps = null;
			int cnt = 0 ;
			
			try{
				conn = pool.getConnection();
				String sql = "delete from member where userid = ? and pwd = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, userid);
				ps.setString(2, pwd);
				cnt = ps.executeUpdate();
			} catch(SQLException e){
				e.printStackTrace();
			} finally{
				pool.dbClose(null, ps, conn);
			}
			return cnt;
		}
}








