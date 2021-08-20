import { useState, useEffect } from 'react';

const Item = function(task, status, username){
    return {
        task: task,
        status: status,
        username: username
    }
}
const defaultListState = {
    items: []
}


const useItems = (defaultState) => {
    const [list, setList] = useState(defaultState);
    useEffect(() => {
        fetchList();
    }, [])
    const fetchList = function(){
        const stringStorage = localStorage.getItem("list");
        let parsed = JSON.parse(stringStorage);
        if (parsed===null){
            parsed=[];
        }
        setList({...list, items: parsed});
    }
    const updateList = function(index){
        const newList = JSON.parse(localStorage.getItem("list"));
        newList[index].status = !newList[index].status;
        localStorage.setItem("list", JSON.stringify(newList));
        fetchList();
    }
    const addItem = function(task){
        const newTask = Item(task, false)
        const newList = [...list.items, newTask]
        const stringifiedList = JSON.stringify(newList);
        localStorage.setItem("list", stringifiedList);
        fetchList();
        window.scrollTo({ left: 0, top: document.body.scrollHeight + 40, behavior: "smooth" });
    }
    const removeItem = function(index){
        const newList = JSON.parse(localStorage.getItem("list"));
        console.log(newList);
        newList.splice(index,1);
        console.log(newList);
        localStorage.setItem("list", JSON.stringify(newList));
        window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
        fetchList();
    }
    return {list, updateList, addItem, removeItem};
}

const store = {
    items: {
        hook: useItems,
        default: defaultListState
    }
}


export default store;