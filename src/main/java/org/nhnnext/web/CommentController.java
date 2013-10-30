package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	

	@RequestMapping(value="/board/{id}/comment", method = RequestMethod.POST)
	public String comment(@PathVariable Long id, String content) {
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(board, content);
		commentRepository.save(comment);
		//return "redirect:/board/" + id;
		return "redirect:/board/list";
	}

	@RequestMapping("/board/{id}/comment_delete")
	public String delete(@PathVariable Long id, Model model) {
		Comment comment = commentRepository.findOne(id);
		commentRepository.delete(id);
		Long board_id = comment.getBoard().getId();
		//return "redirect:/board/" + board_id;
		return "redirect:/board/list";
	}
	
}
