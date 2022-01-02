package com.example.todolist.service;

import com.example.todolist.model.TodoEntity;
import com.example.todolist.model.TodoRequest;
import com.example.todolist.repository.TodoRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@AllArgsConstructor
public class TodoService {
    private final TodoRepository repo;

    public TodoEntity add (TodoRequest request) {
        TodoEntity todoEntitiy = new TodoEntity();

        todoEntitiy.setTitle(request.getTitle());
        todoEntitiy.setOrder(request.getOrder());
        todoEntitiy.setCompleted(request.getCompleted());

        TodoEntity result = this.repo.save(todoEntitiy); // save메소드는 저장된 결과값을 반환한다.

        return result;
    }

    public TodoEntity searchById (Long id) {
        TodoEntity result = this.repo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        return result;
    }

    public List<TodoEntity> searchAll() {
        return this.repo.findAll();
    }

    public TodoEntity updateById(Long id, TodoRequest request) {
        TodoEntity entity = this.searchById(id);

        if (request.getTitle() != null) {
            entity.setTitle(request.getTitle());
        }

        if (request.getOrder() != null) {
            entity.setOrder(request.getOrder());
        }

        if (request.getCompleted() != null) {
            entity.setCompleted(request.getCompleted());
        }

        return this.repo.save(entity);

    }

    public void deleteById (Long id) {
        this.repo.deleteById(id);
    }

    public void deleteByAll () {
        this.repo.deleteAll();
    }
}
