package today.whatdo.festival.festivalinfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import today.whatdo.festival.festivalinfo.service.DibInformationService;
import today.whatdo.festival.festivalinfo.vo.dibInfo.DibInfoVO;
import today.whatdo.festival.userinfo.vo.UserInfoVO;


@Controller
public class DibInformationController {
	
	@Autowired
	private DibInformationService dibInformationService;
	
	//로그인이 돼있어야 리스트 호출
	@GetMapping("/dib-infos")
	@ResponseBody
	public List<DibInfoVO> getDibInformationList(@ModelAttribute DibInfoVO dibInfo, Model model, HttpSession session){
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		dibInfo.setUiNum(userInfo.getUiNum());
		return dibInformationService.getDibInformationList(dibInfo);
	}
	
	//로그인 돼있어야 찜 추가 가능
	@PostMapping("/dib-infos")
	@ResponseBody
	public int insertDibInformation(@RequestBody DibInfoVO dibInfo, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		dibInfo.setUiNum(userInfo.getUiNum());
		return dibInformationService.insertDibInformation(dibInfo);
	}
	
	//로그인 돼있어야 찜 취소 가능
	@DeleteMapping("/dib-infos/{diNum}")
	@ResponseBody
	public int deleteBoardInfo(@PathVariable int diNum, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		DibInfoVO dibInfo = new DibInfoVO();
		dibInfo.setUiNum(userInfo.getUiNum());
		return dibInformationService.deleteDibInformation(diNum);
	}
	
}
