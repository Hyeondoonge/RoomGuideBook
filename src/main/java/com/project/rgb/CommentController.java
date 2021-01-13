package com.project.rgb;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boardAndCommentManagement.CommentService;
import dto.CommentDTO;
import dto.MemberDTO;

@RestController
@RequestMapping("/comments")
public class CommentController {

	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/getCommentList", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentDTO> getList(@RequestParam(value = "no") int no) {
		try {
			List<CommentDTO> commentList = commentService.getList(no);
			return commentList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
	} 

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentDTO commentDTO, HttpSession session) {

		ResponseEntity<String> entity = null;
		try {
			String id = ((MemberDTO) session.getAttribute("member")).getId();
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); // 댓글 등록 성공을 의미
			commentService.register(id, commentDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping(value = "/{no}", method = RequestMethod.PATCH)
	public ResponseEntity<String> update(@PathVariable("no") Integer no, @RequestBody CommentDTO commentDTO) {

		ResponseEntity<String> entity = null;

		try {
			commentService.update(no, commentDTO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping(value = "/{no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("no") Integer no, HttpSession session) {

		ResponseEntity<String> entity = null;
		String id = ((MemberDTO) session.getAttribute("member")).getId();

		try {
			commentService.delete(no, id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return entity;
	}
}
