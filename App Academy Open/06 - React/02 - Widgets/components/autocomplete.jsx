import React, { Component } from 'react'


const NameList = (props) => {
    return <ul>
        {
        props.array.map((ele, i) => {
            return <li key={i}>{ele}</li>
        })
        }
    </ul>
}



export default class AutoComplete extends Component {
    constructor(props){
        super(props); 
        this.originalNames = props.names; 
        this.search = this.search.bind(this);
        this.setSearchText = this.setSearchText.bind(this);
        this.state = {
            searchText: "",
            names: this.originalNames
        }
    };

    setSearchText(event) {
        // DONT FORGET TO USE CALLBACK
        this.setState({searchText: event.currentTarget.value}, () => this.search());
    }

    search(event){
        console.log(this.state.searchText);
        this.setState({names: this.originalNames.filter(name => name.includes(this.state.searchText))});
    }

    
    render() {
        return (
            <div className={"half"}>
                <h1>Autocomplete</h1>
                <div>
                    <input placeholder={"Search"} onChange={this.setSearchText} value={this.state.searchText}>
                    </input>
                    <NameList array={this.state.names}/>
                </div>
            </div>
        )
    }
}
