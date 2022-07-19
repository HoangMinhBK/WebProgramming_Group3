import { Box, Typography, Rating, Button } from "@mui/material";
import DefaultImage from "src/assets/images/default.png";
import { useCustomTheme } from "src/contexts/themeContext";
import { NavLink } from "react-router-dom";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import FavoriteIcon from "@mui/icons-material/Favorite";
import Axios from "axios";
import { baseURL } from "src/configs/api";
import { useFavComicContext } from "src/contexts/favComicContext";

const headers = {
  "Content-Type": "text/json",
  Authorization: `Bearer ${localStorage.getItem("jwt")}`,
  "Access-Control-Allow-Origin": "*",
};

export const isFavorite = (id, favComics) => {
  return favComics.some((comic) => comic.comic_id === id);
};

export const addToFavorite = async (comic_id, setFavComic) => {
  const res1 = await Axios.post(`${baseURL}subscribe/add/${comic_id}`, null, {
    headers: headers,
  }).then((res) => res.status);
  if (res1 === 200) {
    const res2 = await Axios.get(`${baseURL}subscribe/list`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("jwt")}`,
      },
    }).then((res) => res.data);
    setFavComic(res2);
  }
};

export const removeFromFavorite = async (comic_id, setFavComic) => {
  const res1 = await Axios.post(
    `${baseURL}subscribe/remove/${comic_id}`,
    null,
    {
      headers: headers,
    }
  ).then((res) => res.status);
  if (res1 === 200) {
    const res2 = await Axios.get(`${baseURL}subscribe/list`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("jwt")}`,
      },
    }).then((res) => res.data);
    setFavComic(res2);
  }
};

export default function ComicCard({
  id,
  name,
  tag_name,
  current_chapter,
  rating,
  status,
  total_view,
  thumbnail,
}) {
  const {
    aliceBlue,
    uranianBlue,
    lightSkyBlue,
    blueJeans,
    blueJeans2,
    dodgerBlue,
    bleuDeFrance,
    brightNavyBlue,
    greenBlue,
    cobaltBlue,
  } = useCustomTheme();
  const { favComic, setFavComic } = useFavComicContext();

  const comicStatus = {
    ongoing: "orange",
    completed: "green",
    delayed: "red",
  };

  return (
    <Box
      width={300}
      sx={{
        borderRadius: "10px",
        mr: 2,
        mb: 5,
        backgroundImage: `linear-gradient(to bottom, ${cobaltBlue} , ${dodgerBlue})`,
      }}
    >
      <img
        src={thumbnail || DefaultImage}
        alt={name}
        width={300}
        height={350}
        style={{ borderRadius: "10px 10px 0px 0px" }}
      />
      <Box sx={{ p: 2 }}>
        <Box display="flex" justifyContent="space-between">
          <NavLink to={`comics/${id}`} style={{ textDecoration: "none" }}>
            <Typography
              variant="h5"
              sx={{ fontFamily: "ubuntu", fontWeight: "bold", color: "white" }}
            >
              {name}
            </Typography>
          </NavLink>
          {isFavorite(id, favComic) ? (
            <Button
              sx={{ minHeight: 0, minWidth: 0, padding: 0 }}
              onClick={() => removeFromFavorite(id, setFavComic)}
            >
              <FavoriteIcon sx={{ color: "#f74a56" }} />
            </Button>
          ) : (
            <Button
              sx={{ minHeight: 0, minWidth: 0, padding: 0 }}
              onClick={() => addToFavorite(id, setFavComic)}
            >
              <FavoriteBorderIcon sx={{ color: "white" }} />
            </Button>
          )}
        </Box>
        <Typography
          variant="body2"
          sx={{ fontFamily: "ubuntu", color: lightSkyBlue }}
        >
          Current chapter: {current_chapter}
        </Typography>
        <Box
          sx={{
            display: "flex",
            flexDirection: "row",
            justifyContent: "center",
            background: aliceBlue,
            width: "30%",
            borderRadius: "10px",
            selfAlign: "center",
            my: 0.5,
          }}
        >
          <Typography
            variant="body2"
            sx={{
              fontFamily: "ubuntu",
              color: comicStatus[`${status}`],
            }}
          >
            {status}
          </Typography>
        </Box>
        <Typography sx={{ fontFamily: "ubuntu", color: lightSkyBlue }}>
          Genre: {tag_name}
        </Typography>
        <Box width="100%" display="flex" justifyContent="space-between">
          <Typography
            sx={{
              fontFamily: "ubuntu",
              fontStyle: "italic",
              color: aliceBlue,
            }}
          >
            {total_view} views
          </Typography>
          <Rating
            name="half-rating-read"
            defaultValue={rating}
            precision={0.5}
            readOnly
            sx={{ color: aliceBlue }}
          />
        </Box>
      </Box>
    </Box>
  );
}
