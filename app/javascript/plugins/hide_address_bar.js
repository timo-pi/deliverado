const hide_address = () => {
  window.addEventListener("load",function() {
      setTimeout(function(){
          // This hides the address bar:
          window.scrollTo(0, 1);
      }, 0);
  });
}

export { hide_address };
