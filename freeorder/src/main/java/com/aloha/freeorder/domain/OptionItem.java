package com.aloha.freeorder.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OptionItem {
    private Long id;
    private String name;
    private int quantity;
    private int price;
    private int seq;
    private Date createdAt;
    private Date updatedAt;
}