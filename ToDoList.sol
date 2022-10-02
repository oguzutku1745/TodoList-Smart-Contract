// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));

    }

    function updateText(uint _index, string calldata _text) external {
        // We have 2 options, lets assume we will apply both of them 4 times:
        //This method will access to array 4 times
        todos[_index].text = _text;

        // Whereas this will only acces once, and update it 4 times
        //Todo storage todo = todos[_index];
        //todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
