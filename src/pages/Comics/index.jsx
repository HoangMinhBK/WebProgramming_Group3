import {
  Box,
  Typography,
  Button,
  Modal,
  useMediaQuery,
  TextField,
} from "@mui/material";
import { baseURL } from "src/configs/api";
import { NavLink } from "react-router-dom";
import { useCustomTheme } from "src/contexts/themeContext";
import DefaultImage from "src/assets/images/default.png";
import Axios from "axios";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import { useAccountContext } from "src/contexts/accountContext";
import { LoadingBackdrop } from "src/components/Loading";
import CircularProgress from "@mui/material/CircularProgress";

export default function Comics() {
  const { account } = useAccountContext();
  const id = Object.values(useParams())[0];
  const [comic, setComic] = useState({});
  const [comments, setComments] = useState(undefined);
  const [yourComment, setYourComment] = useState("");
  const [chapterArray, setChapterArray] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const fetchData = async () => {
    const data = await Axios.get(`${baseURL}comic/${id}`).then(
      (res) => res.data
    );
    const cmt = await Axios.get(`${baseURL}comment/list/${id}`).then(
      (res) => res.data
    );
    setComic(data);
    setComments(cmt);
    console.log(cmt);
    setChapterArray(() => {
      var arr = [];
      for (let i = 1; i <= data.current_chapter; i++) {
        arr.push(i);
      }
      return arr;
    });
    return data;
  };
  useEffect(() => {
    fetchData();
  }, []);

  const addComment = async () => {
    const res = await Axios.post(
      `${baseURL}comment/add/${id}?comment_content=${yourComment}`,
      null,
      { headers: { Authorization: `Bearer ${localStorage.getItem("jwt")}` } }
    ).then((res) => res.status);
    if (res === 200) {
      const cmt = await Axios.get(`${baseURL}comment/list/${id}`).then(
        (res) => res.data
      );
      setComments(cmt);
      setIsLoading(false);
    }
  };

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

  const [open, setOpen] = useState(false);
  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

  const isMobile = useMediaQuery("(max-width: 600px)");

  return (
    <Box display="flex" flexDirection="column" alignItems="center">
      <LoadingBackdrop open={isLoading} message="Publishing your comment..." />
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box
          sx={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            backgroundColor: "white",
            width: isMobile ? "100%" : 800,
            boxShadow: 24,
            maxHeight: "450px",
            overflowY: "scroll",
            px: 2,
          }}
          display="flex"
          flexDirection="column"
          alignItems="center"
        >
          <Typography
            id="modal-modal-title"
            variant="h5"
            component="h2"
            sx={{ my: 2, fontFamily: "Ubuntu", fontWeight: "bold" }}
          >
            Chapters
          </Typography>
          <Box display="flex" flexWrap="wrap" justifyContent="space-evenly">
            {chapterArray.map((chapter, index) => (
              <NavLink
                to={`${comic.comic_id}/chapters/${index + 1}`}
                style={{ textDecoration: "none" }}
              >
                <Button key={index}>
                  <Typography
                    variant="h6"
                    sx={{ fontFamily: "Ubuntu", fontWeight: "bold" }}
                  >
                    {chapter}
                  </Typography>
                </Button>
              </NavLink>
            ))}
          </Box>
        </Box>
      </Modal>

      <Box width="100%" display="flex" justifyContent="center" sx={{ mt: 10 }}>
        <Box
          width={isMobile ? "100%" : "60%"}
          display="flex"
          justifyContent="space-evenly"
          flexWrap="wrap"
        >
          <Box
            width={isMobile ? "100%" : "35%"}
            display="flex"
            flexDirection="column"
            sx={{ mb: 3 }}
          >
            <img
              src={comic.thumbnail || DefaultImage}
              alt={comic.name}
              width="100%"
              height="auto"
              style={{ borderRadius: "10px" }}
            />
            <Box
              width="100%"
              display="flex"
              justifyContent="space-evenly"
              flexWrap="wrap"
            >
              <Button
                variant="contained"
                sx={{
                  mt: 3,
                  background: dodgerBlue,
                  width: isMobile ? "100%" : undefined,
                }}
                disableFocusRipple
                disableElevation
                disableTouchRipple
                disableRipple
                onClick={handleOpen}
              >
                <Typography sx={{ fontFamily: "ubuntu" }}>Read now</Typography>
              </Button>
            </Box>
          </Box>
          <Box width={isMobile ? "100%" : "50%"}>
            <Typography
              variant={isMobile ? "h4" : "h3"}
              sx={{ fontFamily: "ubuntu", fontWeight: "bold" }}
            >
              {comic.name}
            </Typography>
            <Typography>By {comic.author_name}</Typography>
            <Typography>Status: {comic.status}</Typography>
            <Typography>Current chapter: {comic.current_chapter}</Typography>
            <Typography>Rating: {comic.rating}</Typography>
            <Typography>Total views: {comic.total_view} views</Typography>
            <Box>
              <Typography
                variant="body1"
                sx={{ fontStyle: "italic", fontFamily: "ubuntu", mt: 2 }}
              >
                {comic.des}
              </Typography>
            </Box>
          </Box>
        </Box>
      </Box>
      <Box width={isMobile ? "100%" : "60%"} sx={{ mt: 3 }}>
        <Typography
          variant="h5"
          sx={{ fontFamily: "ubuntu", fontWeight: "bold", mb: 3 }}
        >
          Comments
        </Typography>
        {!comments && (
          <Box display="flex" alignItems="center" sx={{ mb: 2 }}>
            <Typography sx={{ fontFamily: "ubuntu", mr: 2 }}>
              Loading comments...
            </Typography>
            <CircularProgress />
          </Box>
        )}
        {comments !== undefined && comments.length === 0 && (
          <Typography
            sx={{
              fontWeight: "bold",
              fontFamily: "ubuntu",
              mb: 2,
              color: "rgba(0,0,0,0,0.1)",
            }}
            variant="h6"
          >
            Be the first to comment on this manga!
          </Typography>
        )}
        {comments?.map((comment) => (
          <Box sx={{ mb: 3 }}>
            <Typography
              variant="body1"
              sx={{
                fontFamily: "ubuntu",
                fontWeight: "bold",
                color: greenBlue,
              }}
            >
              {comment.display_name}
            </Typography>
            <Box
              sx={{
                py: 2,
                borderRadius: "0px 20px 20px 20px",
                background: uranianBlue,
                width: isMobile ? "100%" : "50%",
              }}
            >
              <Typography variant="body1" sx={{ fontFamily: "ubuntu", ml: 2 }}>
                {comment.content}
              </Typography>
            </Box>
          </Box>
        ))}
        {!account && (
          <Typography variant="h6" sx={{ fontFamily: "ubuntu" }}>
            You need to login to comment
          </Typography>
        )}
        {account && (
          <Box sx={{ mb: 3 }}>
            <Typography
              variant="body1"
              sx={{
                fontFamily: "ubuntu",
                fontWeight: "bold",
                color: greenBlue,
                mb: 0.5,
              }}
            >
              {localStorage.getItem("account")}
            </Typography>
            <Box
              sx={{
                width: isMobile ? "100%" : "50%",
              }}
            >
              <TextField
                placeholder="Write a comment..."
                variant="outlined"
                multiline
                fullWidth
                rows={3}
                value={yourComment}
                onChange={(e) => setYourComment(e.target.value)}
              />
            </Box>
            <Box
              width={isMobile ? "100%" : "50%"}
              display="flex"
              justifyContent="flex-end"
              sx={{ mt: 2 }}
            >
              <Button
                variant="contained"
                disabled={yourComment === ""}
                onClick={() => {
                  setIsLoading(true);
                  addComment();
                  setYourComment("");
                }}
              >
                Send
              </Button>
            </Box>
          </Box>
        )}
      </Box>
    </Box>
  );
}
