using AutoPro.BL.BaseBL;
using AutoPro.BL.BrandBL;
using AutoPro.BL.CartBL;
using AutoPro.BL.ContactBL;
using AutoPro.BL.MaiBL;
using AutoPro.BL.NewsBL;
using AutoPro.BL.NewsCommentBL;
using AutoPro.BL.OrderDetailBL;
using AutoPro.BL.OrdersBL;
using AutoPro.BL.ProductBL;
using AutoPro.BL.ProductCategoryBL;
using AutoPro.BL.ProductCommentBL;
using AutoPro.BL.ProductFavoriteBL;
using AutoPro.BL.UserBL;
using AutoPro.DL;
using AutoPro.DL.BaseDL;
using AutoPro.DL.BrandDL;
using AutoPro.DL.CartDL;
using AutoPro.DL.ContactDL;
using AutoPro.DL.MailDL;
using AutoPro.DL.NewsCommentDL;
using AutoPro.DL.NewsDL;
using AutoPro.DL.OrderDetailDL;
using AutoPro.DL.OrdersDL;
using AutoPro.DL.ProductCategoryDL;
using AutoPro.DL.ProductCommentDL;
using AutoPro.DL.ProductDL;
using AutoPro.DL.ProductFavoriteDL;
using AutoPro.DL.UserDL;
using VNpay.VNPayBL;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";


builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins("http://example.com",
                                              "http://www.contoso.com");
                      });
});
builder.Services.AddScoped(typeof(IBaseBL<>), typeof(BaseBL<>));
builder.Services.AddScoped(typeof(IBaseDL<>), typeof(BaseDL<>));

builder.Services.AddScoped<IUserBL, UserBL>();
builder.Services.AddScoped<IUserDL, UserDL>();

builder.Services.AddScoped<IBrandBL, BrandBL>();
builder.Services.AddScoped<IBrandDL, BrandDL>();

builder.Services.AddScoped<ICartBL, CartBL>();
builder.Services.AddScoped<ICartDL, CartDL>();


builder.Services.AddScoped<IContactBL, ContactBL>();
builder.Services.AddScoped<IContactDL, ContactDL>();

builder.Services.AddScoped<INewsBL, NewsBL>();
builder.Services.AddScoped<INewsDL, NewsDL>();

builder.Services.AddScoped<INewsCommentBL, NewsCommentBL>();
builder.Services.AddScoped<INewsCommentDL, NewsCommentDL>();

builder.Services.AddScoped<IOrderDetailBL, OrderDetailBL>();
builder.Services.AddScoped<IOrderDetailDL, OrderDetailDL>();

builder.Services.AddScoped<IOrdersBL, OrdersBL>();
builder.Services.AddScoped<IOrdersDL, OrdersDL>();

builder.Services.AddScoped<IProductBL, ProductBL>();
builder.Services.AddScoped<IProductDL, ProductDL>();

builder.Services.AddScoped<IProductCategoryBL, ProductCategoryBL>();
builder.Services.AddScoped<IProductCategoryDL, ProductCategoryDL>();

builder.Services.AddScoped<IProductCommentBL, ProductCommentBL>();
builder.Services.AddScoped<IProductCommentDL, ProductCommentDL>();

builder.Services.AddScoped<IProductFavoriteBL, ProductFavoriteBL>();
builder.Services.AddScoped<IProductFavoriteDL, ProductFavoriteDL>();

builder.Services.AddScoped<IVNPayBL, VNPayBL>();
builder.Services.AddScoped<IMailBL, MailBL>();
builder.Services.AddScoped<IMailDL, MailDL>();

DatabaseContext.ConnectionString = builder.Configuration.GetConnectionString("MySQL");
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
                      });
});

builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(3660);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseSession();
app.MapControllers();
app.UseCors(MyAllowSpecificOrigins);

app.Run();
