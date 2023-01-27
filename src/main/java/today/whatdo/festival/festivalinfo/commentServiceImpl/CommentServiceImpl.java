package today.whatdo.festival.festivalinfo.commentServiceImpl;

import java.util.List;

import today.whatdo.festival.festivalinfo.vo.commentInfo.CommentVO;

public interface CommentServiceImpl {
	
	
	void CommentRegist(CommentVO vo); //댓글 등록
	List<CommentVO> getList(int fiNum); //목록 요청
	int getTotal(int fiNum); //댓글 개수
	int commentDelete(int ciNum);
	

}
