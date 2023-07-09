package com.go.test.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Data
@Table(name="user", 
	uniqueConstraints = {@UniqueConstraint(columnNames = {"user_id"})})
@NoArgsConstructor

public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_code")
    private Long userCode;

    @Column(name = "user_id", unique = true, nullable = false)
    private String userId;

    @Column(name = "user_password", nullable = false)
    private String userPwd;

    @Column(name = "user_name", nullable = false)
    private String userName;

    @Column(name = "uesr_email")
    private String userEmail;

    @Column(name = "user_phone")
    private String userPhone;

    @Column(name = "dep_code", nullable = false)
    private Integer depCode;

    @Column(name = "user_del")
    private boolean userDel;

    @CreationTimestamp
    @Temporal(TemporalType.DATE)
    @Column(name = "user_date")
    private Date userDate;

    @CreationTimestamp
    @Temporal(TemporalType.DATE)
    @Column(name = "user_update")
    private Date userUpdate;
    
}
