import { createContext, useContext } from "react";
import Axios from "axios";
import { baseURL } from "src/configs/api";
import { useEffect, useState } from "react";
const ComicContext = createContext();

export default function ComicProvider({ children }) {
  const [comic, setComic] = useState([]);
  const [tags, setTags] = useState([]);
  const [originalComic, setOriginalComic] = useState([]);
  const fetchData = async () => {
    const data = await Axios.get(`${baseURL}comic`).then((res) => res.data);
    const tags = await Axios.get(`${baseURL}tags`).then((res) => res.data);
    setTags(tags);
    setComic(data);
    setOriginalComic(data);
    return { data, tags };
  };
  useEffect(() => {
    fetchData();
  }, []);

  return (
    <ComicContext.Provider value={{ originalComic, comic, tags, setComic }}>
      {children}
    </ComicContext.Provider>
  );
}
export const useComicContext = () => useContext(ComicContext);
