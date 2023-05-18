using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;
using AutoPro.Common.Entities.DTO;

namespace AutoPro.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private IHostingEnvironment _hostingEnvironment;

        public UploadController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpPost("upload-image")]
        public async Task<IActionResult> UploadImage()
        {
            var form = await Request.ReadFormAsync();
            var file = form.Files.FirstOrDefault();
            if (file == null)
            {
                return BadRequest("No file selected.");
            }

            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "images", file.FileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { imageUrl = $"/images/{file.FileName}" });
        }

        [HttpGet("imgName/{imgName}")]
        public IActionResult GetImg([FromRoute] string imgName)
        {
            try
            {
                string path = _hostingEnvironment.WebRootPath + "\\images\\";
                var filePath = path + imgName + ".jpg";
                if (System.IO.File.Exists(filePath))
                {
                    byte[] b = System.IO.File.ReadAllBytes(filePath);
                    return File(b, "images/jpg");
                }
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, new ErrorResult
                {
                    ErrorCode = Common.Enum.ErrorCode.Exception,
                    DevMsg = ex.Message,
                    UserMsg = Common.Resource.Resource.UserMsg_DuplicateEmail,
                    TraceId = HttpContext.TraceIdentifier
                });
            }
        }
    }
}
