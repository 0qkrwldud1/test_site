package com.go.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Data
@Table(name="reply")
public class Reply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "rep_id")
	private Long repId;
	
	@Column (name = "rep_writer")
	private String repWriter;
	
	@Column (name = "rep_content")
	private String repContent;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-mm-dd")
	@Column (name = "rep_date")
	private Date repDate;
	
	@ManyToOne
	@JoinColumn(name="bd_id")
	private Board board;
	
	@ManyToOne
	@JoinColumn (name = "user_id")
	private User user;
	
}
