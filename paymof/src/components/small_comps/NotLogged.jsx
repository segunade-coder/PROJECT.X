const NotLogged = () => {
  return (
    <h1 style={{ textAlign: "center", color: "#494848" }}>
      Opps! you have been logged out. Try{" "}
      <a href="../login" className="btn btn-link">
        loging
      </a>
      in again
    </h1>
  );
};

export default NotLogged;
