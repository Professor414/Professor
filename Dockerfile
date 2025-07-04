# --- START OF FILE: Dockerfile ---

# ប្រើ Python 3.11 ជា base image
FROM python:3.11-slim

# កំណត់ Working Directory នៅក្នុង Container
WORKDIR /app

# ដំឡើង FFmpeg (កម្មវិធីសម្រាប់កាត់តវីដេអូ)
RUN apt-get update && apt-get install -y ffmpeg

# ចម្លងไฟล์ requirements.txt ចូលទៅក្នុង container
COPY requirements.txt .

# ដំឡើង Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# ចម្លងไฟล์កូដ bot របស់អ្នកចូលទៅក្នុង container
COPY user_bot.py .

# កំណត់ Command ដើម្បីដំណើរការ bot នៅពេល container ចាប់ផ្ដើម
CMD ["python", "user_bot.py"]

# --- END OF FILE: Dockerfile ---
