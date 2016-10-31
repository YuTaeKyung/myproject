package myproject.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import myproject.db.ConnectionPoolMgr;

public class ZipcodeDAO {
	private ConnectionPoolMgr pool;
	
	public ZipcodeDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ZipcodeVO> alist = new ArrayList<ZipcodeVO>();
		try{
			conn = pool.getConnection();
			String sql = "select * from zipcode "
					+ " where dong like '%' || ? || '%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dong);
			rs = ps.executeQuery();
			
			while(rs.next()){
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong2 =rs.getString("dong");
				String startbunji = rs.getString("startbunji");
				String endbunji = rs.getString("endbunji");
				int seq = rs.getInt("seq");
				
				ZipcodeVO vo = new ZipcodeVO(zipcode, sido, gugun, dong2, startbunji, endbunji, seq);
				alist.add(vo);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(rs, ps, conn);
		}
		return alist;
	}
}
