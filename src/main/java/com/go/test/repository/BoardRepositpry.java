package com.go.test.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.go.test.model.Board;

public interface BoardRepositpry extends JpaRepository<Board, Long> {

	Page<Board> findByTitleContaining(String word, Pageable pageable);
	
}
