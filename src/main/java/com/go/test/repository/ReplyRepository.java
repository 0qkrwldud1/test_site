package com.go.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.go.test.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long> {

	@Query("select r from Reply r join fetch r.board where bd_id=?1")
	public List<Reply> replyList(Long bno);
	
}
