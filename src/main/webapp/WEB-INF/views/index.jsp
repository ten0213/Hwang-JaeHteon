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
            <label>
                <input type="checkbox">
            </label>123
        </td>
    </tr>
</table>

<script>
    const list = document.getElementById('list');
    const click1 = async () => {
        fetch("/test", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            }
        })
            .then((res) => res.text())
            .then((res) => list.innerText = res);
    }
    const click2 = async () => {
        fetch("/test2", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            }
        })
            .then((res) => res.json())
            .then((res) => console.log(res));
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
</script>
</body>
</html>