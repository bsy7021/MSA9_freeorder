package com.aloha.freeorder.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
    private String id;
    private boolean enabled;
    private String thumbnail;
    private String type;
    private String title;
    private String content;
    private Date createdAt;
    private Date updatedAt;

    private MultipartFile thumbFile;
    private MultipartFile contentFile;
}
