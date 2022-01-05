<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>My first project : Todolist</title>
</head>
<body>
HELLO WORLD
<button onclick="click1()">버튼1</button>
<button onclick="click2()">버튼2</button>
<button onclick="click3()">추가</button>
<table id="list">
  <tr>
    <td>
      <label>
        <input type="checkbox">
      </label>123
    </td>
  </tr>
</table>
</body>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>HELLO</title>
  </head>
  <body>
  HELLO WORLD
  <button onclick="click1()">버튼1</button>
  <button onclick="click2()">버튼2</button>
  <button onclick="click3()">추가</button>
  <table id="list">
    <tr>
      <td>
        <input type="checkbox">123
      </td>
    </tr>
  </table>
  </body>
>>>>>>> github/master
</html>

<script>
  const list = document.getElementById('list');
  const click1 = async () => {
    fetch("/test", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      }
    })
<<<<<<< HEAD
            .then((res) => res.text())
            .then((res) => list.innerText = res);
=======
    .then((res) => res.text())
    .then((res) => list.innerText = res);
>>>>>>> github/master
  }

  const click2 = async () => {
    fetch("/test2", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      }
    })
<<<<<<< HEAD
            .then((res) => res.json())
            .then((res) => console.log(res));
=======
    .then((res) => res.json())
    .then((res) => console.log(res));
>>>>>>> github/master
  }

  const click3 = () => {
    const tr = document.createElement('tr');
    const td = document.createElement('td');
    const input = document.createElement('input');
    input.setAttribute('type', 'checkbox');
    td.appendChild(input);
    tr.appendChild(td);
    td.innerText = '123';
    list.appendChild(tr);
  }
<<<<<<< HEAD
</script>
=======
</script>
>>>>>>> github/master
