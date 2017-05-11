using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace ESAAtl
{
    public delegate object TNewESA(Type Type_rclsid);

    //---------------------------------------------------------------------------
    // AxESAAtlHost - creator of unregistered ESAAtl ActiveX objects
    public class AxESAAtlHost : System.Windows.Forms.AxHost
    {
        // Summary:
        //     Initializes a new instance of the System.Windows.Forms.AxHost class, wrapping
        //     the ActiveX control indicated by the specified CLSID.
        //
        // Parameters:
        //   clsid:
        //     The CLSID of the ActiveX control to wrap.
        public AxESAAtlHost(string clsid)
            : base(clsid)
        {
        }
        //
        // Summary:
        //     Initializes a new instance of the System.Windows.Forms.AxHost class, wrapping
        //     the ActiveX control indicated by the specified CLSID, and using the shortcut-menu
        //     behavior indicated by the specified flags value.
        //
        // Parameters:
        //   flags:
        //     An System.Int32 that modifies the shortcut-menu behavior for the control.
        //
        //   clsid:
        //     The CLSID of the ActiveX control to wrap.
        public AxESAAtlHost(string clsid, int flags)
            : base(clsid, flags)
        {
        }


        protected override object CreateInstanceCore(Guid clsid)
        {
            object obj2 = null;
            // obj2 = System.Windows.Forms.UnsafeNativeMethods.CoCreateInstance(ref clsid, null, 1, ref NativeMethods.ActiveX.IID_IUnknown);

            // GUID of the required interface
            Guid IID_IUnknown = new Guid("00000000-0000-0000-C000-000000000046");

            obj2 = ESAActivator.CoCreateInstance(clsid, null, 1, IID_IUnknown);
            return obj2;
        }
    }


    //---------------------------------------------------------------------------
    // Base bind with ESAAtl

    class ESAAtl80
    {
        // Imported methods
        [DllImport("ESAAtl80Extern.dll", PreserveSig = false)]
        static extern void ESAAtl_Init([MarshalAs(UnmanagedType.LPWStr)] string ESAPath, ref uint pRetValue);

        [DllImport("ESAAtl80Extern.dll", PreserveSig = false)]
        static extern void ESAAtl_InitMultithread([MarshalAs(UnmanagedType.LPWStr)] string ESAPath, ref uint pRetValue);

        [DllImport("ESAAtl80Extern.dll", PreserveSig = false)]
        [return: MarshalAs(UnmanagedType.IUnknown)]
        static extern object ESAAtl_CoGetClassObjectESA(
        [MarshalAs(UnmanagedType.LPStruct)] Guid rclsid,
        uint dwClsContext,
        uint pvReserved,
        [MarshalAs(UnmanagedType.LPStruct)] Guid riid);

        [DllImport("ESAAtl80Extern.dll", PreserveSig = false)]
        [return: MarshalAs(UnmanagedType.IUnknown)]
        static extern object ESAAtl_CoCreateInstanceESA(
        [MarshalAs(UnmanagedType.LPStruct)] Guid rclsid,
        [MarshalAs(UnmanagedType.IUnknown)] object pUnkOuter,
        uint dwClsContext,
        [MarshalAs(UnmanagedType.LPStruct)] Guid riid);

        [DllImport("ESAAtl80Extern.dll", PreserveSig = false)]
        static extern void ESAAtl_Terminate();

        protected bool _Create(string ESAPath, bool bMultithread)
        {
            String AppPath = System.Windows.Forms.Application.StartupPath;
            String ESAAtlExternPath = AppPath;
            if (!ESAAtlExternPath.EndsWith("\\"))
                ESAAtlExternPath += "\\";
            ESAAtlExternPath +="ESAAtl80Extern.dll";
            if (!System.IO.File.Exists(ESAAtlExternPath))
            {
                System.Windows.Forms.MessageBox.Show("Unable to find " + ESAAtlExternPath + "\nPlease copy dll into this folder !");
                return false;
            }

            uint nRetVal = 0;
            if (!bMultithread)
            {
                ESAAtl_Init(ESAPath, ref nRetVal);
            }
            else
            {
                ESAAtl_InitMultithread(ESAPath, ref nRetVal);
            }
            if (nRetVal == 0)
            {
                return false;
            }
            return true;
        }

        public bool Create(string ESAPath)
        {
            return _Create(ESAPath, false);
        }

        public void Destroy()
        {
            ESAAtl_Terminate();
        }

        public bool CreateMultithread(string ESAPath)
        {
            return _Create(ESAPath, true);
        }

        // Create class factory of COM object from ESAATL
        public object CoGetClassObject(Guid rclsid, uint dwClsContext, uint pvReserved, Guid riid)
        {
            return ESAAtl_CoGetClassObjectESA(rclsid, dwClsContext, pvReserved, riid);
        }
        public object CoGetClassObject(Type Type_rclsid, uint dwClsContext, uint pvReserved, Guid riid)
        {
            return CoGetClassObject(Type_rclsid.GUID, dwClsContext, pvReserved, riid);
        }
        public object CoGetClassObject(Type Type_rclsid, uint dwClsContext, uint pvReserved, Type Type_riid)
        {
            return CoGetClassObject(Type_rclsid.GUID, dwClsContext, pvReserved, Type_riid.GUID);
        }

        // Create COM object from ESAATL
        public object CoCreateInstance(Guid rclsid, object pUnkOuter, uint dwClsContext, Guid riid)
        {
            return ESAAtl_CoCreateInstanceESA(rclsid, pUnkOuter, dwClsContext, riid);
        }
        public object CoCreateInstance(Type Type_rclsid, object pUnkOuter, uint dwClsContext, Guid riid)
        {
            return CoCreateInstance(Type_rclsid.GUID, pUnkOuter, dwClsContext, riid);
        }
        public object CoCreateInstance(Type Type_rclsid, object pUnkOuter, uint dwClsContext, Type Type_riid)
        {
            return CoCreateInstance(Type_rclsid.GUID, pUnkOuter, dwClsContext, Type_riid.GUID);
        }
        public object CoCreateInstance(Type Type_rclsid)
        {
            Guid IID_IUnknown = new Guid("00000000-0000-0000-C000-000000000046");
            return CoCreateInstance(Type_rclsid.GUID, null, 1, IID_IUnknown);
        }
    }

    //---------------------------------------------------------------------------
    // ESAAtl activator
    class ESAActivator
    {
        volatile static object lockESAPath = new Object();
        volatile static object lockGetESAAtl = new Object();

        protected volatile static string g_ESAPath;
        protected volatile static bool g_bUseMultithread = false;
        protected volatile static ESAAtl80 g_ESAAtl = null;

        public static void SetESAPath(string ESAPath)
        {
            lock (lockESAPath)
            {
                g_ESAPath = ESAPath;
            }
        }
        
        public static void SetMultithreaded(bool bUseMultithread)
        {
            lock (lockESAPath)
            {
                if (g_bUseMultithread == bUseMultithread)
                {
                    return;
                }
                if (g_ESAAtl != null)
                {
                    throw new InvalidComObjectException("ESAAtl80::SetMultithreaded You can't change appartment model when is EsaAtl loaded !");
                }
                g_bUseMultithread = bUseMultithread;
            }
        }

        protected static ESAAtl80 GetESAAtl()
        {
            lock (lockGetESAAtl)
            {
                if (g_ESAAtl == null)
                {
                    string locESAPath;
                    lock (lockESAPath)
                    {
                        locESAPath = g_ESAPath;
                    }
                    bool bIsEsaAtlInitialized = false;
                    ESAAtl80 locESAAtl = new ESAAtl80();
                    if (!g_bUseMultithread)
                    {
                        bIsEsaAtlInitialized = locESAAtl.Create(locESAPath);
                    }
                    else
                    {
                        bIsEsaAtlInitialized = locESAAtl.CreateMultithread(locESAPath);
                    }
                    if (!bIsEsaAtlInitialized)
                    {
                        throw new InvalidComObjectException("ESAAtl80::Create");
                    }
                    g_ESAAtl = locESAAtl;
                }
            }
            return g_ESAAtl;
        }

        public static void Destroy()
        {
            lock (lockGetESAAtl)
            {
                if (g_ESAAtl != null)
                {
                    g_ESAAtl.Destroy();
                    g_ESAAtl = null;
                }
            }
        }

        public static object newESA(Type Type_rclsid)
        {
            return GetESAAtl().CoCreateInstance(Type_rclsid);
        }

        // Create COM object from ESAATL
        public static object CoCreateInstance(Guid rclsid, object pUnkOuter, uint dwClsContext, Guid riid)
        {
            return GetESAAtl().CoCreateInstance(rclsid, pUnkOuter, dwClsContext, riid);
        }
        public static object CoCreateInstance(Type Type_rclsid, object pUnkOuter, uint dwClsContext, Guid riid)
        {
            return GetESAAtl().CoCreateInstance(Type_rclsid.GUID, pUnkOuter, dwClsContext, riid);
        }
        public static object CoCreateInstance(Type Type_rclsid, object pUnkOuter, uint dwClsContext, Type Type_riid)
        {
            return GetESAAtl().CoCreateInstance(Type_rclsid.GUID, pUnkOuter, dwClsContext, Type_riid.GUID);
        }
        public static object CoCreateInstance(Type Type_rclsid)
        {
            return GetESAAtl().CoCreateInstance(Type_rclsid);
        }
    }
}
