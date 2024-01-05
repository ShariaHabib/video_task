# Project Overview

## Description

In this app user can watch the treding videos that comes from a REST API. It follows a structured architecture pattern known as the Bloc (Business Logic Component) pattern for efficient state management. All the information is retrived from the API.
## Key Components

1. **Video Player Integration:**
   - Utilizes the Dart `video_player` package for seamless video playback functionality.
   - Integrated the `chewie` package, which acts as a wrapper around `video_player` to provide additional features and simplify the video playback experience.

2. **Pagination:**
   - Implemented pagination to handle a potentially infinite number of pages of video content efficiently.

4. **Bloc Pattern:**
   - Adopts the Bloc pattern for organizing business logic and managing the state of the application.
   - Separates concerns by having distinct Blocs for different functionalities, making the codebase modular and maintainable.

3. **REST API Integration:**
   - The app communicates with a REST API to fetch video-related details like manifest file, thumbnail, duration, and channel name.
   - This dynamic fetching of information allows the app to stay updated with the latest content from the server.

## Screenshots

Andriod Emulator (Pixel 3A):

![Screenshot_1704467834](https://github.com/ShariaHabib/video_task/assets/59577264/f3be3267-73a2-4239-9e99-f7ea3d0b2e7a)
![Screenshot_1704467923](https://github.com/ShariaHabib/video_task/assets/59577264/f347ef3e-5332-4267-8576-51c189793cf2)
![Screenshot_1704467841](https://github.com/ShariaHabib/video_task/assets/59577264/b8fe2929-0759-4246-b34c-9c0eb743627c)
![Screenshot_1704467732](https://github.com/ShariaHabib/video_task/assets/59577264/2f0742f4-b018-456f-9e79-4f964831be16)
![Screenshot_1704467846](https://github.com/ShariaHabib/video_task/assets/59577264/439f2f99-6664-4feb-a242-051469ea334f)

Screenshots in personal android (Redmi Note 7pro):

![Screenshot_2024-01-05-20-24-23-832_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/a13ebf0c-e3f3-4926-95a0-5195721ac1d1)
![Screenshot_2024-01-05-20-24-27-368_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/44e296cd-bf61-4951-8b3a-7d71dc8104f4)
![Screenshot_2024-01-04-23-27-56-070_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/333bab54-288a-457c-80be-5bff629671fd)
![Screenshot_2024-01-05-20-24-34-224_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/4f3be261-ca58-4ac4-9bc0-4f39c92645b4)
![Screenshot_2024-01-04-23-27-47-007_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/43c03256-0065-490c-818f-76ef3f277de0)
![Screenshot_2024-01-05-20-24-43-877_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/046fb842-a4a6-48d5-a8f8-ee3b1bf7579a)
![Screenshot_2024-01-05-20-24-11-010_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/6517bed7-4fe2-4a0b-bde7-54a67177f428)
![Screenshot_2024-01-05-20-24-04-851_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/c60619d8-ddc8-40a0-9fe9-f2ef971d3b7a)
![Screenshot_2024-01-05-20-23-56-694_com example video_task](https://github.com/ShariaHabib/video_task/assets/59577264/b3c3c32d-3881-4a50-90dc-8c29caa0aedb)
