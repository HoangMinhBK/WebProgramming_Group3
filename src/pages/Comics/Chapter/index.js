import { useParams } from "react-router-dom";
import { Box, useMediaQuery, Typography, Link } from "@mui/material";
import Axios from "axios";
import { useEffect, useState } from "react";
import { baseURL } from "src/configs/api";
import { useComicContext } from "src/contexts/comicContext";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";

export default function Chapter() {
  const isMobile = useMediaQuery("(max-width:600px)");
  const comic_id = Object.values(useParams())[0];
  const chap_num = Object.values(useParams())[1];
  const { originalComic } = useComicContext();
  const comic = originalComic.filter(
    (comic, index) => index === comic_id - 1
  )[0];
  const [chapters, setChapters] = useState([]);
  const fetchData = async () => {
    const data = await Axios.get(
      `${baseURL}comics/${comic_id}/chapters/${chap_num}`
    ).then((res) => res.data);
    setChapters(data);
  };
  useEffect(() => {
    fetchData();
  }, []);
  return (
    <Box
      display="flex"
      flexDirection="column"
      alignItems="center"
      sx={{ mt: 3 }}
    >
      <Box
        display="flex"
        sx={{ my: 4 }}
        width={isMobile ? "145%" : undefined}
        justifyContent="center"
      >
        <Typography
          sx={{ fontFamily: "ubuntu", fontWeight: "bold", mr: 2 }}
          variant={isMobile ? "h5" : "h4"}
        >
          {comic?.name}{" "}
        </Typography>
        <Typography
          sx={{ fontFamily: "ubuntu" }}
          variant={isMobile ? "h5" : "h4"}
        >
          - Chapter {chap_num}
        </Typography>
      </Box>
      {chapters?.map((chapter, index) => {
        return (
          <img
            src={Object.values(chapter)}
            alt=""
            width={isMobile ? "145%" : "50%"}
            key={index}
          />
        );
      })}
      <Box
        display="flex"
        justifyContent="center"
        alignItems="center"
        width={isMobile ? "100%" : "40%"}
        sx={{ mt: 3 }}
      >
        {" "}
        <Link href={`/comics/${comic_id}/chapters/${parseInt(chap_num) - 1}`}>
          {parseInt(chap_num) !== 1 && (
            <ArrowBackIosIcon fontSize="small" sx={{ mr: 2 }} />
          )}
        </Link>
        <Typography sx={{ fontFamily: "ubuntu" }}>
          Chapter {chap_num}
        </Typography>
        <Link href={`/comics/${comic_id}/chapters/${parseInt(chap_num) + 1}`}>
          <ArrowForwardIosIcon fontSize="small" sx={{ ml: 2 }} />
        </Link>
      </Box>
    </Box>
  );
}
