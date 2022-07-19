import { Skeleton, Box, Backdrop, Typography } from "@mui/material";
import CircularProgress from "@mui/material/CircularProgress";

export const LoadingBackdrop = ({ open, message }) => {
  return (
    <Backdrop
      sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={open}
    >
      <Typography variant="h4" sx={{ mr: 2, fontWeight: "bold" }}>
        {message}
      </Typography>
      <CircularProgress color="inherit" />
    </Backdrop>
  );
};
export const ComicCardSkeleton = () => {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  return (
    <Box
      display="flex"
      justifyContent="space-between"
      width="100%"
      flexWrap="wrap"
    >
      {arr.map((item, index) => (
        <Box
          width={300}
          sx={{
            borderRadius: "10px",
            mr: 2,
            mb: 5,
          }}
        >
          <Skeleton
            width={300}
            height={500}
            sx={{ mb: -10 }}
            animation="wave"
          />
          <Box>
            <Box
              display="flex"
              justifyContent="space-between"
              alignItems="center"
            >
              <Skeleton width={170} height={50} animation="wave" />
              <Skeleton
                width={40}
                height={40}
                variant="circular"
                animation={false}
              />
            </Box>
            <Skeleton width={110} height={30} />
            <Skeleton width={100} height={30} animation="wave" />
            <Skeleton width={120} height={30} animation={false} />
            <Box width="100%" display="flex" justifyContent="space-between">
              <Skeleton width={100} height={30} />
              <Skeleton width={100} height={30} animation="wave" />
            </Box>
          </Box>
        </Box>
      ))}
    </Box>
  );
};
