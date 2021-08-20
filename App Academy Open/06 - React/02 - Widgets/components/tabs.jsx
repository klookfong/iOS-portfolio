import React, { Component } from 'react'

export default class Tabs extends Component {
    constructor(props){
        super(props);
        this.state={
            tab: "App",
            view: "first"
        };
        this.setTab = this.setTab.bind(this);
    }

    setTab(event){
        let newView = this.state.view;
        switch(event.currentTarget.value){
            case "App":
                newView = "first"
                break;
            case "Academy":
                newView = "second"
                break;
            default:
                newView = "third"
                break;
        }
        this.setState({view: newView});
    }

    render() {
        return (
            <div className={"half"}>
                <h1>My Tab Bar</h1>
                <div>
                    {
                    ["App", "Academy", "Open"].map((ele, i) => {
                    return <button type={"button"} className={"btn btn-dark"} value={ele} key={i} onClick={this.setTab}>{ele}</button>
                    })
                    }
                </div>
                <div className={"componentContainer bg-info"}>
                    {this.state.view}
                </div>
            </div>
        )
    }
}
