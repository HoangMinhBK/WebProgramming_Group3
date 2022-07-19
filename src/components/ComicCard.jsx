import { Box, Typography, Rating } from "@mui/material";
import DefaultImage from "src/assets/images/default.png";
import { useCustomTheme } from "src/contexts/themeContext";
import { NavLink } from "react-router-dom";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import FavoriteIcon from "@mui/icons-material/Favorite";
import Axios from "axios";
import { baseURL } from "src/configs/api";

export const isFavorite = (id) => {
  if (
    localStorage.getItem("subscribe") !== undefined ||
    localStorage.getItem("subscribe") !== null
  )
    return localStorage.getItem("subscribe")?.includes(id);
  return false;
};

export const addToFavorite = async (comic_id) => {
  const res1 = await Axios.post(`${baseURL}subscribe/add/${comic_id}`, {
    headers: {
      Authorization: `Bearer ${localStorage.getItem("jwt")}`,
    },
  }).then((res) => res.status);

};

export default function ComicCard({
  id,
  name,
  author_name,
  tag_name,
  current_chapter,
  rating,
  status,
  total_view,
  des,
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
          {isFavorite(id) ? (
            <FavoriteIcon sx={{ color: "#f74a56" }} />
          ) : (
            <FavoriteBorderIcon sx={{ color: "white" }} />
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
