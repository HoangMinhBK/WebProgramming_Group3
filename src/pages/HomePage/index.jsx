import ComicCard from "src/components/ComicCard";
import { Box, Typography } from "@mui/material";
import { useComicContext } from "src/contexts/comicContext";
import Tips from "src/components/Tips";
import { useAccountContext } from "src/contexts/accountContext";
import { ComicCardSkeleton } from "src/components/Loading";
import { useCustomTheme } from "src/contexts/themeContext";
import { useState } from "react";

export default function HomePage() {
  const { originalComic, tags, comic, setComic } = useComicContext();
  const [active, setActive] = useState(-1);
  const { account } = useAccountContext();

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

  const filterComicByGenre = (genre) => {
    setComic(originalComic.filter((comic) => comic.tag_name === genre));
  };
  console.log(account);

  return (
    <Box
      width="100%"
      display="flex"
      flexDirection="column"
      alignItems="center"
      justifyContent="center"
      sx={{ mt: 10 }}
    >
      {!account && <Tips />}
      <Box
        sx={{ mt: 4 }}
        display="flex"
        width="100%"
        justifyContent="space-evenly"
        flexWrap="wrap"
      >
        <Box
          sx={{
            py: 1,
            px: 1.5,
            mb: 0.5,
            background: active === -1 ? bleuDeFrance : lightSkyBlue,
            borderRadius: "20px",
            color: active === -1 ? aliceBlue : cobaltBlue,
            fontWeight: active === -1 ? "bold" : "normal",
            "&:hover": {
              background: bleuDeFrance,
              color: aliceBlue,
              cursor: "pointer",
              fontWeight: "bold",
            },
          }}
          onClick={() => {
            setComic(originalComic);
            setActive(-1);
          }}
        >
          All
        </Box>
        {tags &&
          tags.length > 0 &&
          tags.map((tag, index) => (
            <Box
              sx={{
                py: 1,
                px: 1.5,
                mb: 0.5,
                background: active === index ? bleuDeFrance : lightSkyBlue,
                borderRadius: "20px",
                color: active === index ? aliceBlue : cobaltBlue,
                fontWeight: active === index ? "bold" : "normal",
                "&:hover": {
                  background: bleuDeFrance,
                  color: aliceBlue,
                  cursor: "pointer",
                  fontWeight: "bold",
                },
              }}
              onClick={() => {
                filterComicByGenre(tag.name);
                setActive(index);
              }}
            >
              {tag.name}
            </Box>
          ))}
      </Box>
      <Box
        display="flex"
        flexWrap="wrap"
        justifyContent="space-evenly"
        sx={{ mt: 3 }}
      >
        {originalComic.length === 0 && <ComicCardSkeleton />}
        {originalComic.length !== 0 &&
          comic?.map((comic, index) => (
            <ComicCard
              key={index}
              id={comic.comic_id}
              name={comic.name}
              author_name={comic.author_name}
              current_chapter={comic.current_chapter}
              rating={comic.rating}
              status={comic.status}
              total_view={comic.total_view}
              thumbnail={comic.thumbnail}
              tag_name={comic.tag_name}
            />
          ))}
        {comic.length === 0 && (
          <Typography
            variant="h5"
            sx={{
              fontFamily: "ubuntu",
              fontWeight: "bold",
              color: "rgba(0,0,0,0,0.3)",
              opacity: 0.5,
            }}
          >
            No mangas found!
          </Typography>
        )}
      </Box>
    </Box>
  );
}
