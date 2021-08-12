using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace EmployeeDAL.Models
{
    public partial class TestingContext : DbContext
    {
        public TestingContext()
        {
        }

        public TestingContext(DbContextOptions<TestingContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<Nationality> Nationalities { get; set; }

        //Login Models and Db Sets

        public virtual DbSet<Users> User { get; set; }
        public virtual DbSet<Roles> Role { get; set; }
        public virtual DbSet<Departments> Department { get; set; }
        public virtual DbSet<City> Cities { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=Testing;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("Employee");

                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.DateOfBirth)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.FkGenderId).HasColumnName("FK_GenderID");

                entity.Property(e => e.FkNationId).HasColumnName("FK_NationID");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Surname)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.FkGender)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.FkGenderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Gender");

                entity.HasOne(d => d.FkNation)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.FkNationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Nationality");
            });

            modelBuilder.Entity<Gender>(entity =>
            {
                entity.ToTable("Gender");

                entity.Property(e => e.GenderId)
                    .ValueGeneratedNever()
                    .HasColumnName("GenderID");

                entity.Property(e => e.GenderType)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Nationality>(entity =>
            {
                entity.HasKey(e => e.NationId);

                entity.ToTable("Nationality");

                entity.Property(e => e.NationId)
                    .ValueGeneratedNever()
                    .HasColumnName("NationID");

                entity.Property(e => e.NationalityGroup)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.ToTable("Users");

                entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("Id");

                entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

                entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

                entity.Property(e => e.AdminName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

                entity.Property(e => e.FkCityId).HasColumnName("FK_CityID");
                entity.HasOne(d => d.FkCity)
               .WithMany(p => p.User)
               .HasForeignKey(d => d.FkCityId)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_Users_City");


                entity.Property(e => e.FkDepartmentId).HasColumnName("FK_DepartmentID");
                entity.HasOne(d => d.FkDepartment)
               .WithMany(p => p.User)
               .HasForeignKey(d => d.FkDepartmentId)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_Users_Department");

                entity.Property(e => e.VerificationCode)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

                entity.Property(e => e.FkRoleId).HasColumnName("FK_RoleID");

                entity.HasOne(d => d.FkRole)
                .WithMany(p => p.User)
                .HasForeignKey(d => d.FkRoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_Roles");
            });

            modelBuilder.Entity<Departments>(entity =>
            {
                entity.HasKey(e => e.DepartmentID);
                entity.ToTable("Departments");

                entity.Property(e => e.DepartmentID)
                .ValueGeneratedNever()
                .HasColumnName("DepartmentID");

                entity.Property(e => e.DepartmentName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            });

            modelBuilder.Entity<City>(entity =>
            {
                entity.HasKey(e => e.CityID);
                entity.ToTable("City");

                entity.Property(e => e.CityID)
                .ValueGeneratedNever()
                .HasColumnName("CityID");

                entity.Property(e => e.CityName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            });

            modelBuilder.Entity<Roles>(entity =>
            {
                entity.HasKey(e => e.RoleId);
                entity.ToTable("Roles");

                entity.Property(e => e.RoleId)
                .ValueGeneratedNever()
                .HasColumnName("RoleId");

                entity.Property(e => e.RoleName)
                .IsRequired()
                .HasMaxLength(20)
                .IsUnicode(false);
            });



            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
