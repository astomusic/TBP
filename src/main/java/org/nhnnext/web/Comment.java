package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length=5000, nullable = false)
	private String content;

	@JsonIgnore
	@ManyToOne
	private Board board;
	
	public Board getBoard() {
		return board;
	}
	
	public Comment() {
		
	} 
	
	public Comment(Board board, String content) { 
		this.board = board; 
		this.content = content; 
	}
	
	public String getContent() {
		return content;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
