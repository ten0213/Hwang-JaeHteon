package com.example.todolist.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TodoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // 고유 ID(id)

    @Column(nullable = false)
    private String title;

    @Column(name = "seq", nullable = false)
    private Long order; // 순서(order)

    @Column(nullable = false)
    private Boolean completed; // 처리 유무(completed)

}

