var React = require('react');


var FormComponent = React.createClass({
  getInitialState: function(){
    return {inputValue: ''}
  },
  handleClick: function(){
    // prevents the browser from default refreshing the page after we hit submit
    event.preventDefault();
    this.props.onItemSubmit(this.state.inputValue)
  },
  render: function(){
    return (
      <div>
        <form>
          <input placeholder="thing" value={this.state.inputValue} onChange={this.updateValue}/>
          <button onClick={this.handleClick}>Submit</button>
        </form>
      </div>
    )
  },
  updateValue: function(event){
    this.setState({inputValue: event.target.value})
  }
})

module.exports = FormComponent;
