import { Component } from "react";
// import { Spring } from '@react-spring/web';
import logo from "../../images/logo-white.png";

class ErrorBoundary extends Component {
  state = {
    hasError: false,
    error: null,
    errorInfo: null,
  };
  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }

  componentDidCatch(error, errorInfo) {
    this.setState({ errorInfo });
  }

  render() {
    const { hasError } = this.state;

    if (hasError) {
      return (
        <div>
          {/* <h1>Oops! Something went wrong.</h1>
              <p>We apologize for the inconvenience. Please try again later.</p>
              <h5>For Developer.</h5>
              <details style={{ whiteSpace: 'pre-wrap' }}>
                {error && error.toString()}
                <br />
                {errorInfo && errorInfo.componentStack}
          </details> */}
          <div className="error">
            <div
              style={{ fontFamily: "Poppins-Bold", marginTop: "5rem" }}
              className="d-flex justify-content-center mb-5 align-items-center"
            >
              <img src={logo} alt="" width={50} height={50} />
              <h2 style={{ marginLeft: "0.5rem" }}>Paymof</h2>
            </div>
            <div className="d-flex justify-content-center align-items-center w-100 flex-column mt-5 h-100 gap-2">
              <h3>ERROR OCCURRED</h3>
              <span>Something went wrong </span>

              <a
                href="#"
                onClick={() => window.location.reload()}
                style={{ textDecoration: "none" }}
              >
                Refresh
              </a>
            </div>
          </div>
        </div>
      );
    }

    // eslint-disable-next-line react/prop-types
    return this.props.children;
  }
}

export default ErrorBoundary;
