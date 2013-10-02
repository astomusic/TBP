package org.nhnnext.web;

import java.util.ArrayList;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(Board board, MultipartFile img_file) {
		//System.out.println("Board: " + board);
		//System.out.println("filename: " + img_file.getOriginalFilename());
		// TODO FileUploader API를 활용해 업로드한 파일을 복사한다.
		FileUploader.upload(img_file);
		// TODO 첨부한 이미지 정보를 데이터베이스에 추가한다.
		board.setAttachment(img_file.getOriginalFilename());
		boardRepository.save(board);
		return "redirect:/";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		Iterable<Board> boardlist;
		//= new ArrayList<Board>();
		boardlist = boardRepository.findAll();
		System.out.println("라라랄?:" + boardlist);
		model.addAttribute("boardlist", boardlist);
		return "list";
	}
	
	@RequestMapping("/{id}/modify")
	public String modify(@PathVariable Long id, Model model) {
		Board board = boardRepository.findOne(id);
		model.addAttribute("board", board);
		boardRepository.delete(id);
		return "modify";
	}

	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable Long id, Model model) {
		boardRepository.delete(id);
		return "redirect:/";
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model) {
		Board board = boardRepository.findOne(id);
		model.addAttribute("board", board);
	// TODO DB에서 id에 해당하는 Board 데이터를 조회해야 한다.
	// TODO 조회한 Board 데이터를 Model에 저장해야 한다.
	return "show";
	}
	
}
