import { createContext, useContext } from "react";
import Axios from "axios";
import { baseURL } from "src/configs/api";
import { useEffect, useState } from "react";
import { useAccountContext } from "./accountContext";
const FavComicContext = createContext();

export default function FavComicProvider({ children }) {
  const [favComic, setFavComic] = useState([]);
  const { account } = useAccountContext();
  const fetchData = async () => {
    if (account) {
      const data = await Axios.get(`${baseURL}subscribe/list`, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("jwt")}`,
        },
      }).then((res) => res.data);
      setFavComic(data);
    } else setFavComic([]);
  };
  useEffect(() => {
    fetchData();
  }, [account]);

  return (
    <FavComicContext.Provider value={{ favComic, setFavComic }}>
      {children}
    </FavComicContext.Provider>
  );
}
export const useFavComicContext = () => useContext(FavComicContext);
