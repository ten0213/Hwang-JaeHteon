<%@ page contentType="text/html;charset=UTF-8" language="java" %>
-->

<html>
<head>
    <style>

        body {
            margin: 0;
            min-width: 250px;
        }

        ul li {
            cursor: pointer;
            position: relative;
            padding: 12px 8px 12px 40px;
            list-style-type: none;
            background: #eee;
            font-size: 18px;
            transition: 0.2s;

            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        ul li:nth-child(odd) {
            background: #f9f9f9;
        }

        ul li:hover {
            background: #ddd;
        }

        /* Darker background-color on hover */
        ul li:hover {
            background: #ddd;
        }

        /* When clicked on, add a background color and strike out text */
        ul li.checked {
            background: #888;
            color: #fff;
            text-decoration: line-through;
        }

        /* Add a "checked" mark when clicked on */
        ul li.checked::before {
            content: '';
            position: absolute;
            border-color: #fff;
            border-style: solid;
            border-width: 0 2px 2px 0;
            top: 10px;
            left: 16px;
            transform: rotate(45deg);
            height: 15px;
            width: 7px;
        }


        .close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 12px 16px 12px 16px;
        }

        .close:hover {
            background-color: #f44336;
            color: white;
        }

        .header {
            background-color: #f44336;
            padding: 30px 40px;
            color: white;
            text-align: center;
        }

        .header:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Style the input */
        input {
            font-size: 16px;
            width: 75%;
            margin: 0;
            padding: 10px;
            border: none;


            float: left;

        }

        /* Style the "Add" button */
        .addBtn {
            padding: 10px;
            width: 10%;
            background: #d9d9d9;
            border: 0;
            color: #555;
            float: right;

            font-size: 16px;
            cursor: pointer;

        }

        .addBtn:hover {
            background-color: #bbb;
        }

    </style>
    <title>todolist</title>
</head>
<body>

<div id="myDIV" class="header">
    <h2 style="margin:5px">My first project : ToDo List</h2>
    <label for="myInput"></label><input type="text" id="myInput" placeholder="Title..." title="insert your todo">
    <span onclick="newElement()" class="addBtn">Add</span>
</div>

<ul id="myExistData">
</ul>

<script>

    var myNodeList = document.getElementsByTagName("li");
    var i;
    for (i = 0; i < myNodeList.length; i++) {
        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        myNodeList[i].appendChild(span);
    }


    var close = document.getElementsByClassName("close");
    var i;
    for (i = 0; i < close.length; i++) {
        close[i].onclick = function () {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }


    var list = document.querySelector('ul');
    list.addEventListener('click', function (ev) {
        if (ev.target.tagName === 'LI') {
            ev.target.classList.toggle('checked');
        }
    }, false);


    function newElement() {
        const inputValue = document.getElementById("myInput").value;
        fetch("/", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                title: inputValue,
                order: 1,
                completed: false
            }),
        })
            .then((res) => res.json())
            .then((res) => initTodoList(res));
        const li = document.createElement("li");
        const t = document.createTextNode(inputValue);
        li.appendChild(t);
        if (inputValue === '') {
            alert("You must write something!");
        } else {
            alert("Your todo will be added");
            document.getElementById("myExistData").appendChild(li);
        }
        document.getElementById("myInput").value = "";

        const span = document.createElement("SPAN");
        const txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function () {
                const div = this.parentElement;
                div.style.display = "none";
            }
        }


    }


    window.onload = function () {
        fetch("/todolist", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            }
        })
            .then((res) => res.json())
            .then((res) => initTodoList(res));
    }


    const initTodoList = (todolist) => {
        const list = document.getElementById("myExistData");
        for (let i = 0; i < todolist.length; i++) {
            const li = document.createElement("li");
            li.innerText = todolist[i].title;
            const span = document.createElement("span");
            span.onclick = function () {

                fetch("/todolist/" + id, {
                    method: "DELETE",
                    headers: {
                        "Content-Type": "application/json",
                    }
                })
                    .then((res) => res.json())
                    .then((res) => {
                        initTodoList(res);
                    });
            }
            const txt = document.createTextNode("\u00D7");
            span.className = "close";
            span.appendChild(txt);
            li.appendChild(span);
            list.appendChild(li);
        }
    }
</script>
</body>
</html>