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

    public TodoEntity add(TodoRequest request) {
        TodoEntity todoEntity = new TodoEntity();

        todoEntity.setTitle(request.getTitle());
        todoEntity.setOrder(request.getOrder());
        todoEntity.setCompleted(request.getCompleted());

        return this.repo.save(todoEntity);
    }

    public TodoEntity searchById (Long id) {
        return this.repo.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
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
