package com.example.todolist.service;

import com.example.todolist.model.TodoModel;
import com.example.todolist.model.TodoRequest;
import com.example.todolist.service.repository.TodoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class TodoService {

    private final TodoRepository todoRepository;

    //    1	todo 리스트 목록에 아이템을 추가
    public TodoModel add(TodoRequest request) {
        return null;
    }
    //    2	todo  리스트 목록 중 특정 아이템을 조회
    public TodoModel searchById(Long id) {
        return null;
    }
    //    3	todo 리스트 전체 목록을 조회
    public List<TodoModel> searchAll() {
        return null;
    }
    //    4	todo 리스트 목록 중 특정 아이템을 수정
    public TodoModel updateById(Long id) {
        return null;
    }
    //    5	todo 리스트 목록 중 특정 아이템을 삭제
    public void deleteById(Long id) {

    }
    //    6	todo 리스트 전체 목록을 삭제
    public void deleteAll() {

    }

}