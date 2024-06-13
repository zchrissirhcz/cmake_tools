#include <opencv2/opencv.hpp>

int main()
{
    cv::Mat image(256, 256, CV_8UC3);
    cv::imshow("image", image);
    cv::waitKey(0);
    return 0;
}
