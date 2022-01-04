package com.example.todolist.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TodoResponse {
    private Long id;
    private String title;
    private Long order;
    private Boolean completed;

}

