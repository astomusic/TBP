package org.nhnnext.repository;

import org.nhnnext.web.Board; 
import org.nhnnext.web.Comment;
import org.springframework.data.repository.CrudRepository;

public interface CommentRepository extends CrudRepository<Comment, Long> {


}