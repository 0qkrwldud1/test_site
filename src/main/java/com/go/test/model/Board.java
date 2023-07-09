package com.go.test.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Data
@Table(name="board")
public class Board {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "bd_id")
	private Long bdId;
	
	@Column (name = "bd_title")
	private String bdTitle;
	
	@Column (name = "bd_writer")
	private String bdWriter;
	
	@Lob
	@Column (name = "bd_content")
	private String bdContent;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column (name = "bd_date")
	private Date bdDate;
	
	@Column (name = "bd_cnt")
	private Long bdCnt;
	
	@OneToMany( mappedBy = "board", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonIgnore
	private List<Reply> reply;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	// db에 저장하기 전에 실행되는 로직
	// 엔티티 객체에 저장하기 전에 필요한 작업을 수행
	@PrePersist
	public void prePersist() {
		this.bdCnt = this.bdCnt == null? 0 : this.bdCnt;
	}
	
	
}
