package myproject.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import myproject.db.ConnectionPoolMgr;

public class BoardDAO {
	private ConnectionPoolMgr pool;
	
	public BoardDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	
	public int insertBoard(BoardVO vo){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;
		
		try{
			conn =pool.getConnection();
			String sql = "insert into board "
					+ "(no,name,pwd,title,email,content,fileName,fileSize,groupNo) "
					+ "values (board_seq.nextval,?,?,?,?,?,?,?,board_seq.nextval)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			
			cnt = ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt = "+cnt+" ,vo = "+vo);
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	public List<BoardVO> selectAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardVO> alist = new ArrayList<BoardVO>();
		try{
			conn = pool.getConnection();
			String sql = "select * from board order by groupNo desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				BoardVO vo = new BoardVO();
				vo.setName(name);
				vo.setTitle(title);
				vo.setName(name);
				vo.setRegdate(regdate);
				vo.setReadcount(readcount);
				
				alist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();	
		} finally{
			pool.dbClose(rs, ps, conn);
		}
		return alist;
	}
}
