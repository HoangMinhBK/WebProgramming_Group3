import Axios from "axios";
import { baseURL } from "src/configs/api";

export default async function handleLogin(username, password) {
  let payload = { username: username, password: password };
  try {
    let res = await Axios.post(baseURL + "login", payload);
    if (res.status === 200) {
      localStorage.setItem("jwt", res?.data?.token);
      localStorage.setItem("account", res?.data?.display_name);

      return res;
    }
  } catch (err) {
    return err.response;
  }
}
