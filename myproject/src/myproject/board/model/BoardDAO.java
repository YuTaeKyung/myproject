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
	
	public List<BoardVO> selectAll(String category,String keyword,String align){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardVO> alist = new ArrayList<BoardVO>();
		try{
			conn = pool.getConnection();
			String sql = "select * from board ";
			if(keyword!=null&&!keyword.isEmpty()){
				sql+= " where "+ category + " like "
						+ "'%' || ? || '%' ";
			}
				if(align.equals("no")||align==null ||align.isEmpty()){
					sql+= " order by groupno desc, sortno asc";
				} else if(align.equals("title")&& !align.isEmpty()&& align!=null){
					sql+= " order by title desc";
				} else if(align.equals("name")&& !align.isEmpty()&& align!=null){
					sql+= " order by name desc";
				} else if(align.equals("regdate")&& !align.isEmpty()&& align!=null){
					sql+= " order by regdate desc";
				} else if(align.equals("readcount")&& !align.isEmpty()&& align!=null){
					sql+= " order by readcount desc";
				} else if(align.equals("good")&& !align.isEmpty()&& align!=null){
					sql+= " order by good desc";
				} else if(align.equals("bad")&& !align.isEmpty()&& align!=null){
					sql+= " order by bad desc";
				}
				
				
				
			ps = conn.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()){
				ps.setString(1, keyword);
			}
			rs = ps.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				
				String fileName = rs.getString("filename");
				long fileSize = rs.getLong("filesize");
				int downcount = rs.getInt("downcount");
				
				int groupNo = rs.getInt("groupno");
				int sortNo = rs.getInt("sortno");
				int step = rs.getInt("step");
				
				BoardVO vo = new BoardVO();
				vo.setNo(no);
				vo.setName(name);
				vo.setTitle(title);
				vo.setRegdate(regdate);
				vo.setReadcount(readcount);
				vo.setGood(good);
				vo.setBad(bad);
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setDowncount(downcount);
				vo.setGroupNo(groupNo);
				vo.setSortNo(sortNo);
				vo.setStep(step);
				alist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();	
		} finally{
			pool.dbClose(rs, ps, conn);
		}
		return alist;
	}
	
	public BoardVO selectByNo(int no){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardVO vo = null;
		try{
			conn = pool.getConnection();
			String sql = "select * from board where no = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()){
				String name = rs.getString("name");
				String title = rs.getString("title");
				String email = rs.getString("email");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				String fileName = rs.getString("filename");
				int fileSize = rs.getInt("filesize");
				String content = rs.getString("content");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				int no1 = rs.getInt("no");
				String pwd = rs.getString("pwd");
				int groupNo = rs.getInt("groupNo");
				int sortNo = rs.getInt("sortno");
				int step = rs.getInt("step");
				vo = new BoardVO();
				vo.setNo(no1);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setTitle(title);
				vo.setEmail(email);
				vo.setRegdate(regdate);
				vo.setReadcount(readcount);
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setContent(content);
				vo.setGood(good);
				vo.setBad(bad);
				vo.setGroupNo(groupNo);
				vo.setSortNo(sortNo);
				vo.setStep(step);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(rs, ps, conn);
		}
		return vo;
	}
	
	public boolean checkPwd(String pwd, int no){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		try{
			conn = pool.getConnection();
			String sql = "select pwd from board where no = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				String dbPwd = rs.getString("pwd");
				
				if(dbPwd.equals(pwd)){
					result = true;
				}
			}
			System.out.println("비밀번호 체크 결과 는" + result);
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(rs, ps, conn);
		}
		return result;
	}
	
	public int updateBoard(BoardVO vo){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;
		try{
			conn = pool.getConnection();
			String sql = "update board set name = ? , title = ?, "
					+ " email = ?, content = ? ";
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){
				sql+=", filename = ?, filesize=?, downcount = 0 ";
			}
			
			sql+=" where no = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getEmail());
			ps.setString(4, vo.getContent());
			
			if(vo.getFileName()!=null&&!vo.getFileName().isEmpty()){
				ps.setString(5, vo.getFileName());
				ps.setLong(6, vo.getFileSize());
				ps.setLong(7, vo.getNo());
			} else{
				ps.setInt(5, vo.getNo());
			}
			
			cnt = ps.executeUpdate();
			System.out.println("글 수정 결과, cnt =" + cnt + "vo =" +vo);
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	public int deleteBoard(int no, String pwd){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;

		
		
		
		String sql = "delete from board where no = ? and pwd = ?";
		try {
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, pwd);
	
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	public int updateReadCount(int no){
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update board set readcount = readcount+1 where no = ? ";
		int cnt = 0;
		try{
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt =ps.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	public int updateGood(int no){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;
		String sql = "update board set good = good+1 where no = ?";
		
		try{
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt = ps.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	public int updateBad(int no){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;
		String sql = "update board set bad = bad+1 where no = ?";
		
		try{
			conn = pool.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt = ps.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
	
	
	
	public int reply(BoardVO vo){
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = 0;
		
		try{
			conn = pool.getConnection();
			conn.setAutoCommit(false);
			String sql = "update board set sortno = sortno+1 "
					+ " where groupno = ? and sortno > ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt = ps.executeUpdate();
			
			sql = "insert into board ( "
					+ " no,name,pwd,title,email,content,groupno,step,sortno,"
					+ " filename, filesize  "
					+ " ) values ( board_seq.nextval, "
					+ "?,?,?,?,?,?,?,?,?,?)";
			ps.close();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setInt(6, vo.getGroupNo());
			ps.setInt(7, vo.getStep()+1);
			ps.setInt(8, vo.getSortNo()+1);
			ps.setString(9, vo.getFileName());
			ps.setLong(10, vo.getFileSize());
			cnt = ps.executeUpdate();
			conn.commit();
			
		} catch(SQLException e){
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			pool.dbClose(null, ps, conn);
		}
		return cnt;
	}
}

















