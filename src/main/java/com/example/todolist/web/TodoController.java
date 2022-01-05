package com.example.todolist.web;

import com.example.todolist.model.TodoModel;
import com.example.todolist.model.TodoResponse;
import com.example.todolist.service.TodoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class TodoController {

    private final TodoService service;

    @GetMapping(path = "/")
    public String index(){
        return "index";
    }

    @GetMapping(path = "/test")
    @ResponseBody
    public String test(){
        //logic
        return "TEST";
    }

    @GetMapping(path = "/test2")
    public ResponseEntity<TodoResponse> test2(){
        TodoResponse result = TodoResponse.builder()
                .id(1L)
                .completed(true)
                .order(1L)
                .title("제목")
                .build();
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<TodoResponse> create() {
        System.out.println("CREATE");
        return null;
    }

    @GetMapping("{id}")
    public ResponseEntity<TodoResponse> readOne(@PathVariable String id) {
        System.out.println("READ ONE");
        return null;
    }

    @GetMapping
    public ResponseEntity<List<TodoModel>> readAll() {
        System.out.println("READ ALL");
        return null;
    }

    @PatchMapping("{id}")
    public ResponseEntity<TodoModel> update(@PathVariable String id) {
        System.out.println("UPDATE");
        return null;
    }

    @DeleteMapping("{id}")
    public ResponseEntity<?> deleteOne(@PathVariable String id) {
        System.out.println("DELETE ONE");
        return  null;
    }

    @DeleteMapping
    public ResponseEntity<?> deleteAll() {
        System.out.println("DELETE ALL");
        return null;
    }
}