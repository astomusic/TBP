package org.nhnnext.web;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length=100, nullable = false)
	private String title;
	@Column(length=5000, nullable = false)
	private String contents;
	@Column(length=5000, nullable = false)
	private String attachment;
	
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER) 
	private List<Comment> comments;

	public List<Comment> getComments() { 
		return comments;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	
	@Override
	public String toString() {
		return "Board [title=" + title + ", contents=" + contents + "]";
	}
}
