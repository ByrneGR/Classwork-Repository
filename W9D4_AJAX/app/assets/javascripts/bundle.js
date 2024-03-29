/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {


class FollowToggle{ // attached to every button;
    constructor($el){ // options hash: user-id etc extra info 
    // debugger
      this.$el = $el // button
      this.userId = $el.data('user-id') // comes from _form (data-*)
      this.followState = $el.data('initial-follow-state')
      this.render(); // method within this class;

      this.$el.on('click', (event) => {
            // passing button as the second argument will be placing a click handler on all the children elements;
            this.handleClick(event);
        })
    }

  render() {
    if(this.followState === "unfollowed"){
    //   debugger
        // this.$el.empty();
        this.$el.html("Follow!"); 
        // we left the button blank, so that we can "append" what we write here.
    }else{
        // this.$el.empty();
        this.$el.html("Unfollow!");
    }
  }

  handleClick(event){
    // debugger;
    // ajax triggers callbacks in order to prevent the whole page from re-rendering
    // to process small data asynchronously
    // what datatype does ajax fetch? --> promise.
    
    event.preventDefault(); // prevents from auto-refreshing the page aka submit the form;

      if(this.followState === "unfollowed"){

        //   debugger;
          $.ajax({ // why? -- to make it brief and to make it ASYNCH! b/c the page doesnt get refreshed!!
            method: 'POST',
            url: `/users/${this.userId}/follow`,
          }).then(() => { // once the ajax request has returned successfully;
            this.followState = "followed";
            this.render();
          })
      }else{
        //   debugger;
          $.ajax({ 
            // ajax is created with vanilla JS, which can complicate the codes (.catch is a vanilla JS method cf .fail jquery method);
            // $ in "$.ajax" turns an ajax request into a jequery request, and allows us to call jquery method on it (.render, .fail, etc.)
            method: 'DELETE',
            url: `/users/${this.userId}/follow`,
          }).then(() => { // returns another promise obj (promise makes things simplify the code visually);
              this.followState = "unfollowed";
              this.render();
          })
        // .fail() can also be chained at the end;
      }
  }

}


module.exports = FollowToggle;

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

$(function(){ // jquery .ready()
  $('button.follow-toggle').each((idx, button) => new FollowToggle($(button)));
    // turn the button argument into jquery obj by adding $

  // all the button(HTML tag) with the class of "follow-toggle"
  // each button has a new instance of the FollowToggle
})



/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map